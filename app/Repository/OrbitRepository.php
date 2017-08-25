<?php
declare(strict_types=1);

namespace App\Repository;

use App\Models\OrbitModel;
use Illuminate\Support\Facades\DB;

/**
 * Class OrbitRepository
 * @package App\Repository
 */
class OrbitRepository
{
    /**
     * @return OrbitModel[]
     */
    public function getHazardous()
    {
        return OrbitModel::where('hazardous', true)->get();
    }

    /**
     * @param bool $hazardous
     *
     * @return mixed
     */
    public function getFastest($hazardous = false)
    {
        return OrbitModel::where('hazardous', $hazardous)->get();
    }

    /**
     * @param bool $hazardous
     *
     * @return string
     */
    public function bestYear($hazardous = false)
    {
        $query = DB::table('orbit')->where('hazardous', $hazardous)
            ->groupBy('agg_year')
            ->select(DB::raw("date_part('year', orbit_determination_date) as agg_year, count(id)"))
            ->limit(1);

        $result = array_first($query->get());
        if ($result) {
            return $result->agg_year;
        }

        return '';
    }

    /**
     * @param bool $hazardous
     *
     * @return string
     */
    public function bestMonth($hazardous = false)
    {
        $query = DB::table('orbit')->where('hazardous', $hazardous)
            ->groupBy('agg_month')
            ->select(DB::raw("date_part('month', orbit_determination_date) as agg_month, count(id)"))
            ->limit(1);

        $result = array_first($query->get());
        if ($result) {
            return $result->agg_month;
        }

        return '';
    }
}
